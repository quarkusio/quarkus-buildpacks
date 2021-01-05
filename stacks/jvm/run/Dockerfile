ARG base_image
FROM ${base_image}
#FROM registry.access.redhat.com/ubi8-minimal

# Set required CNB information
# ARG cnb_uid=185
# ARG cnb_gid=185
ARG stack_id

ENV CNB_STACK_ID=${stack_id}
ENV CNB_USER_ID=185
ENV CNB_GROUP_ID=185

LABEL io.buildpacks.stack.id="${stack_id}"
