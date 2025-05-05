# Use official nginx image
FROM nginx:alpine

# Remove default nginx files
RUN rm -rf /usr/share/nginx/html/*

# Copy HTML files to nginx directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 90

# Start nginx
CMD ["nginx", "-g", "daemon off;"]