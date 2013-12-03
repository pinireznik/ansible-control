#!/bin/bash

ANSIBLE_IMAGE=preznik/ansible-control-test

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
			for NODES in ansible node1 node2
			do
        			echo "STARTING ${NODES}"
        			docker run -d -name ${NODES} ${ANSIBLE_IMAGE}
				docker inspect ${NODES} | grep IPAddress
			done
                        shift
                        ;;
                stop)
                        for NODES in ansible node1 node2
                        do
                                echo "STOPPING ${NODES}"
                                docker stop ${NODES}
                        done
                        shift
                        ;;
                clean)
                        for NODES in ansible node1 node2
                        do
                                echo "STOPPING AND CLEANNING ${NODES}"
				docker stop ${NODES}
                                docker rm ${NODES}
                        done
			shift
                        ;;
                *)
                        echo "use --help"
                        ;;
        esac
