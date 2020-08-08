FROM alpine:3.12

# Install dependencies
ENV BUILD_DEPS='tar gzip' \
	RUN_DEPS='curl ca-certificates gettext'

RUN apk --no-cache add $BUILD_DEPS $RUN_DEPS

# Install kubectl
ENV KUBECTL_VERSION=v1.16.13

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
	chmod +x ./kubectl && \
	mv ./kubectl /usr/local/bin/

# Clean cache
RUN apk del $BUILD_DEPS

CMD ["sh"]
