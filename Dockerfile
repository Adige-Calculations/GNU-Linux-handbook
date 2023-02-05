FROM rust:1.67   

# Setting the environment variable 
ENV DEBIAN_FRONTEND=noninteractive

# Install mdbook
RUN cargo install mdbook
ENV PATH="/root/.cargo/bin:${PATH}"

# Execute the script to serve the site
RUN mkdir -p /var/www/html/book
COPY . /var/www/html/book
WORKDIR /var/www/html/book

CMD ["mdbook", "serve"]
