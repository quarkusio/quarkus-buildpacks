FROM registry.access.redhat.com/ubi8-minimal

ARG cnb_uid=1001
ARG cnb_gid=1001

RUN microdnf install shadow-utils && \
    groupadd -g ${cnb_gid} quarkus && \
    useradd -u ${cnb_uid} -d /home/quarkus -g ${cnb_gid} quarkus

ENV CNB_USER_ID=${cnb_uid}
ENV CNB_GROUP_ID=${cnb_gid}

USER 1001
WORKDIR /home/quarkus
