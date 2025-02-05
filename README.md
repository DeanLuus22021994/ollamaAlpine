# Pull the minimal image
docker pull alpine/ollama

# Run the Ollama service (API available on port 11434)
docker rm -f ollama
docker run -d -p 11434:11434 -v ~/.ollama/root/.ollama --name ollama alpine/ollama

# Download the "llama3.2" model into the running container
docker exec -ti ollama ollama pull llama3.2

# Alternatively, run a container with the "llama3.2" model pre-integrated
docker run -d -p 11434:11434 --name llama3.2 alpine/llama3.2

# Test the API service
curl http://localhost:11434/api/generate -d '{
  "model": "llama3.2",
  "prompt": "Why is the sky blue?"
}'