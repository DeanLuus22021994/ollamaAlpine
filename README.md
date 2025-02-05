# Pull
docker pull alpine/ollama

# Run
docker rm -f ollama
docker run -d -p 11434:11434 -v ~/.ollama/root/.ollama --name ollama alpine/ollama

# Download
docker exec -ti ollama ollama pull llama3.2

# Alternate
docker run -d -p 11434:11434 --name llama3.2 alpine/llama3.2

# Test
curl http://localhost:11434/api/generate -d '{
  "model": "llama3.2",
  "prompt": "Why is the sky blue?"
}'