$default_env = "pro_v" # デフォルトRailsEnv
$unicorn_user = "root" # slaveの実行ユーザ
$unicorn_group = "root" # slaveの実行グループ

$timeout = 200 # タイムアウト秒数。タイムアウトしたslaveは再起動される
pid 'tmp/pids/unicorn_pro_v.pid'

# String => UNIX domain socket / FixNum => TCP socket
#$listen = "/home/bps/tmp/unicorn.sock"

# ---- end of config ----

# Main Config for Unicorn
rails_env = ENV['RAILS_ENV'] || $default_env

# log 
stderr_path 'log/unicorn_pro_v.log'
stdout_path 'log/unicorn_pro_v.log'

worker_processes 4
preload_app true
timeout $timeout
port = 7000
listen port, :tcp_nopush => true

# For RubyEnterpriseEdition: http://www.rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
if GC.respond_to?(:copy_on_write_friendly=)
 GC.copy_on_write_friendly = true
end

# workerをフォークする前の処理
before_fork do |server, worker|
 ##
 # When sent a USR2, Unicorn will suffix its pidfile with .oldbin and
 # immediately start loading up a new version of itself (loaded with a new
 # version of our app). When this new Unicorn is completely loaded
 # it will begin spawning workers. The first worker spawned will check to
 # see if an .oldbin pidfile exists. If so, this means we've just booted up
 # a new Unicorn and need to tell the old one that it can now die. To do so
 # we send it a QUIT.
 #
 # Using this method we get 0 downtime deploys.

 old_pid = RAILS_ROOT + '/tmp/pids/unicorn_pro_v.pid.oldbin'
 if File.exists?(old_pid) && server.pid != old_pid
   begin
     # 古いマスターがいたら死んでもらう
     Process.kill("QUIT", File.read(old_pid).to_i)
   rescue Errno::ENOENT, Errno::ESRCH
     # someone else did our job for us
   end
 end
end

# workerをフォークしたあとの処理
after_fork do |server, worker|
 ##
 # Unicorn master loads the app then forks off workers - because of the way
 # Unix forking works, we need to make sure we aren't using any of the parent's
 # sockets, e.g. db connection

 ActiveRecord::Base.establish_connection
 #CHIMNEY.client.connect_to_server
 # Redis and Memcached would go here but their connections are established
 # on demand, so the master never opens a socket

 ##
 # Unicorn master is started as root, which is fine, but let's
 # drop the workers to git:git

 begin
   uid, gid = Process.euid, Process.egid
   user, group = $unicorn_user, $unicorn_group
   target_uid = Etc.getpwnam(user).uid
   target_gid = Etc.getgrnam(group).gid
   worker.tmp.chown(target_uid, target_gid)
   if uid != target_uid || gid != target_gid
     Process.initgroups(user, target_gid)
     Process::GID.change_privilege(target_gid)
     Process::UID.change_privilege(target_uid)
   end
 rescue => e
   if RAILS_ENV == 'development'
     STDERR.puts "couldn't change user, oh well"
   else
     raise e
   end
 end
end
