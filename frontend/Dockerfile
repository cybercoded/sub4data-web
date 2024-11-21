# Use the official Node.js image
FROM node:16

WORKDIR /app

# Install dependencies
COPY package.json /app/
RUN npm install

# Copy all files
COPY . /app/

# Expose port 3000 for the React app
EXPOSE 3000

# Start the React development server
CMD ["npm", "start"]