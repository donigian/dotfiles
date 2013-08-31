# Add yourself some shortcuts to projects you often work on
# Example:
#
# brainstormr=/Users/robbyrussell/Projects/development/planetargon/brainstormr

alias tft='tail -1000f ~/servers/tomcat/logs/catalina.out'
alias tom-up='~/servers/tomcat/bin/startup.sh'
alias tom-down='~/servers/tomcat/bin/shutdown.sh'
alias bbe-up='/Users/bkonowitz/servers/preprod-match/bin/startup.sh'
alias bbe-down='/Users/bkonowitz/servers/preprod-match/bin/shutdown.sh'
alias tfbbe='tail -1000f /Users/bkonowitz/servers/preprod-match/logs/catalina.out'
alias istomup='ps -ax | grep tomcat'
alias istibup='ps -ax | grep tibems'
alias tf='tail -10000f '
alias mongo-up='mongod run --config /usr/local/etc/mongod.conf'
alias trunc='cat /dev/null >'
alias reset-things='rm -rf ~/Library/Application\ Support/Cultured\ Code/'
alias e='subl . &'
alias md='mkdir -p '
alias pg_up='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias sz='source ~/.zshrc'
alias somz='subl ~/.oh-my-zsh'

function mcd() {
  mkdir $1 && cd $1;
}

function sstart() {
  cat /dev/null > $1.pid
  nohup $1 &
  echo $! >> $1.pid
}

function kpid() {
  pid=$(cat $1.pid)
  echo "** Killing pid " + $pid
  kill -9 $pid
  sleep 2
  ps ax | grep $1
}

function wpid() {
  echo $! > $1.pid
}

function mk-scala-dir() {
  mkdir -p src/main/{resources,scala}
  mkdir -p test/{resources,scala}
  mkdir -p project/
  touch build.sbt
  printf 'name := "sample"\n\n' >> build.sbt
  printf 'version := "0.0.1"\n\n' >>build.sbt
  printf 'scalaVersion := "2.10.0"\n' >> build.sbt

  touch project/build.properties
  echo "sbt.verison=0.12.3" >> project/build.properties
  touch src/main/scala/hi.scala
  printf 'object Hi {\n\tdef main(args: Array[String]) = println("Hi!")\n}' >> src/main/scala/hi.scala
}