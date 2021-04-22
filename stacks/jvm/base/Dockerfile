FROM registry.access.redhat.com/ubi8/openjdk-11

# ARG cnb_uid=185
# ARG cnb_gid=185

ENV CNB_USER_ID=185
ENV CNB_GROUP_ID=185

# Removing file containing unwanted default values
RUN rm /opt/jboss/container/java/run/run-env.sh

CMD [ "/bin/bash" ]
ENTRYPOINT []
