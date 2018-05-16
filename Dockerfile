FROM nginx:latest
COPY app-jenkins1/startbootstrap-resume-gh-pages /usr/share/nginx/html
EXPOSE 80