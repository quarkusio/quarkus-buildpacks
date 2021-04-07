FROM quay.io/quarkus/centos-quarkus-maven:21.0.0-java11

ARG cnb_uid=1001
ARG cnb_gid=1001

# Set required CNB information
ARG stack_id
ENV CNB_STACK_ID=${stack_id}
ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}

LABEL io.buildpacks.stack.id=${stack_id}

USER 1001

CMD [ "/bin/bash" ]
ENTRYPOINT []
