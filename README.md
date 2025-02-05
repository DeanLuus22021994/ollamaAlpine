# Pull ollama image
docker pull alpine/ollama

# Run ollama service
docker rm -f ollama
docker run -d -p 11434:11434 -v ~/.ollama/root/.ollama --name ollama alpine/ollama

# Pull phi4 model
docker exec -ti ollama ollama pull 14b-q4_K_M

# Test phi4 API
curl http://localhost:11434/api/generate -d '{
  "model": "14b-q4_K_M",
  "prompt": "Explain quantum entanglement."
}'