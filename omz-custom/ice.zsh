export ICE_JAR="/Users/bkonowitz/code/MGM/images/mgm-ice/1.0.0/bin/java/lib/mgm-ice.jar"
export ICE_MAIN="/Users/bkonowitz/code/MGM/mgm-ice/main"
export ICE_WEBAPP="/Users/bkonowitz/servers/apache-tomcat-7.0.23/webapps/mgm-ice"
export RAVEN_BUILDIR="/Users/bkonowitz/code/MGM"

function depice() {
  case $1 in 
    -jar)
      echo "copying mgm-ice.jar"
      cp $ICE_JAR $ICE_WEBAPP/WEB-INF/lib
      tom-down
      sleep 3
      tom-up
      tft
      ;;
    -pages)
      echo "copying pages..."
      cp -r $ICE_MAIN/web/pages $ICE_WEBAPP
      ;;
    -scripts)
      echo "copying scripts..."
      cp -r $ICE_MAIN/web/scripts $ICE_WEBAPP
      ;;
    -web)
      echo "copying pages..."
      cp -r $ICE_MAIN/web/pages $ICE_WEBAPP
      echo "copying scripts..."
      cp -r $ICE_MAIN/web/scripts $ICE_WEBAPP
      ;;
    -build)
      echo "setting environment ..."
      pushd $RAVEN_BUILDIR
      pwd
      . ./setenv.sh
      echo 'building....'
      ./build_component.sh -target rebuild mgm-ice
      popd
      echo 'out of build dir...'
      ;&
    -all)
      echo "copying jar..."
      cp -r $ICE_MAIN/web/pages $ICE_WEBAPP
      echo "copying scripts..."
      cp -r $ICE_MAIN/web/scripts $ICE_WEBAPP
      echo "copying pages..."
      cp $ICE_JAR $ICE_WEBAPP/WEB-INF/lib
      tom-down
      sleep 3
      tom-up
      tft
      ;;
    *)
      echo "Unrecognized operation. Valid operations are: -jar -pages -scripts -web -all"
      ;;
esac
}

