FROM registry.access.redhat.com/quarkus/mandrel-20-rhel8:20.1

ARG cnb_uid=1001
ARG cnb_gid=1001

USER root
RUN dnf --setopt=tsflags=nodocs install -y maven

# Set required CNB information
ARG stack_id
ENV CNB_STACK_ID=${stack_id}
ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}

LABEL io.buildpacks.stack.id=${stack_id}

USER 1001

CMD [ "/bin/bash" ]
ENTRYPOINT []
