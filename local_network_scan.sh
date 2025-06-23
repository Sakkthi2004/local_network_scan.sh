SUBNET=$(ip -o -f inet addr show | awk '/scope global/ {print $4}' | head -n1)

# Check if Nmap is installed
if ! command -v nmap &> /dev/null; then
    echo "❌ Nmap is not installed. Please install it first."
    exit 1
fi

# Create output directory with timestamp
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M-%S")
OUTPUT_DIR="nmap_scan_$TIMESTAMP"
mkdir "$OUTPUT_DIR"

# Define output file names
TEXT_OUTPUT="$OUTPUT_DIR/scan_results.txt"
HTML_OUTPUT="$OUTPUT_DIR/scan_results.html"
XML_OUTPUT="$OUTPUT_DIR/scan_results.xml"

echo "Scanning local network: $SUBNET"
sudo nmap -sS "$SUBNET" -oN "$TEXT_OUTPUT" -oX "$XML_OUTPUT"

# Convert XML to HTML using xsltproc if available
if command -v xsltproc &> /dev/null; then
    xsltproc "$XML_OUTPUT" -o "$HTML_OUTPUT"
    echo " Scan complete. Results saved to:"
    echo "  • $TEXT_OUTPUT"
    echo "  • $HTML_OUTPUT"
else
    echo " xsltproc not found. HTML report not generated."
    echo "Scan complete. Results saved to: $TEXT_OUTPUT"
fi
