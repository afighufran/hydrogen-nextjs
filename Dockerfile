#base image node alpine
FROM node:16-alpine

#mengubah direktori menjadi /app
WORKDIR /app

#copy semua file yang memiliki ekstensi .json dan menjalankan npm install dengan argumen menjalankan package
#yang sudah deprecated
COPY *.json ./
RUN npm install --legacy-peer-deps

#copy semua file termasuk node_modules untuk dijalankan dalam mode production
COPY . .
RUN npm run build

#membuka port 8090 untuk dapat dijalankan di client side
EXPOSE 8090

#command default untuk menjalankan image
CMD [ "npm", "start" ]