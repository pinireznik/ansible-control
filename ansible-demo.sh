#!/bin/bash

ANSIBLE_IMAGE=preznik/ansible-control-test
NODES="ansible node1 node2"


	case "$1" in
                -h|--help)
                        echo "options:"
                        echo "-h, --help                show brief help"
                        echo "start"
                        echo "stop"
			echo "clean"
                        exit 0
                        ;;
                start)
			for NODE in ${NODES}
			do
        			echo "STARTING ${NODE}"
        			docker run -d -name ${NODE} ${ANSIBLE_IMAGE}
				docker inspect ${NODE} | grep IPAddress
			done
			#docker run -d -link node1 -link node2 -name ansible ${ANSIBLE_IMAGE}
                        shift
                        ;;
                stop)
                        for NODE in ${NODES}
                        do
                                echo "STOPPING ${NODE}"
                                docker stop ${NODE}
                        done
                        shift
                        ;;
                clean)
                        for NODE in ${NODES}
                        do
                                echo "STOPPING AND CLEANNING ${NODE}"
				docker kill ${NODE}
                                docker rm ${NODE}
                        done
			shift
                        ;;
                *)
                        echo "use --help"
                        ;;
        esac
