#/bin/zsh

RIGHT_WORK_WS_VIS=$(i3-msg -t get_workspaces | grep -P -o '(?<=\"name\":\"1\",\"visible\":)(.*?)(?=,)')

if [ $RIGHT_WORK_WS_VIS = "true" ];
then
    # switch to fun
    i3-msg -t command "workspace 2; workspace 1"
else
    i3-msg -t command "workspace 4; workspace 3"
fi
