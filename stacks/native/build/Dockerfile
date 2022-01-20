FROM quay.io/quarkus/ubi-quarkus-native-s2i:21.3-java11

ARG cnb_uid=1001
ARG cnb_gid=1001

# Set required CNB information
ARG stack_id
ENV CNB_STACK_ID=${stack_id}
ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}

USER 0
RUN microdnf install -y which findutils && microdnf clean all
USER $CNB_USER_ID

LABEL io.buildpacks.stack.id=${stack_id}

CMD [ "/bin/bash" ]
ENTRYPOINT []
