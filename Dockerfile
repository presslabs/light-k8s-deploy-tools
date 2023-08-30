FROM alpine:3.18

# Install dependencies
ENV BUILD_DEPS='tar gzip' \
	RUN_DEPS='curl ca-certificates gettext jq'

RUN apk --no-cache add $BUILD_DEPS $RUN_DEPS

# Install kubectl
ENV KUBECTL_VERSION=v1.28.1

RUN curl -LO https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/

# Clean cache
RUN apk del $BUILD_DEPS

CMD ["sh"]
