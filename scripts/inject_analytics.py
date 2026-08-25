#!/usr/bin/env python3
import argparse
import os
import sys

def main():
    parser = argparse.ArgumentParser(description="Inject GA4 Measurement ID into HTML files.")
    parser.add_argument("--ga-id", default=os.getenv("GA_MEASUREMENT_ID", ""), help="GA4 Measurement ID (e.g. G-XXXXXXXXXX)")
    parser.add_argument("--file", default="index.html", help="HTML file to update (default: index.html)")
    args = parser.parse_args()

    ga_id = args.ga_id.strip()
    file_path = args.file

    if not os.path.exists(file_path):
        print(f"File not found: {file_path}", file=sys.stderr)
        sys.exit(1)

    if not ga_id:
        print("No GA_MEASUREMENT_ID provided. Skipping injection.")
        return

    with open(file_path, "r", encoding="utf-8") as f:
        content = f.read()

    # Replace placeholder
    new_content = content.replace("__GA_MEASUREMENT_ID__", ga_id)

    with open(file_path, "w", encoding="utf-8") as f:
        f.write(new_content)

    print(f"Successfully injected GA4 ID ({ga_id[:3]}***) into {file_path}")

if __name__ == "__main__":
    main()
