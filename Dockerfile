FROM your-app:latest

RUN curl -fsSL https://tailscale.com/install.sh | sh

COPY tailscaled.conf /etc/tailscale/tailscaled.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
