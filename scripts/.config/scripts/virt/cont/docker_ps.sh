sudo docker ps \
    --format="\
ID\t{{.ID}}\n\
NAME\t{{.Names}}\n\
IMAGE\t{{.Image}}\n\
PORTS\t{{.Ports}}\n\
COMMAND\t{{.Command}}\n\
CREATED\t{{.CreatedAt}}\n\
STATUS\t{{.Status}}\n\n\
"
