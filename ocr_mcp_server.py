from mcp.server.fastmcp import FastMCP
import subprocess

mcp = FastMCP("tesseract-ocr", host="0.0.0.0", port=8931)

@mcp.tool()
def ocr_image(image_path: str, lang: str = "vie") -> str:
    """OCR văn bản từ file ảnh (đường dẫn trong container /input/), trả về text nhận diện được."""
    result = subprocess.run(
        ["tesseract", image_path, "stdout", "-l", lang],
        capture_output=True, text=True
    )
    if result.returncode != 0:
        return f"Lỗi OCR: {result.stderr}"
    return result.stdout.strip()

if __name__ == "__main__":
    mcp.run(transport="streamable-http")
