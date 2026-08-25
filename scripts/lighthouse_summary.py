#!/usr/bin/env python3
import argparse
import glob
import json
import os
import sys

def score_badge(score):
    if score is None:
        return "N/A"
    pct = round(score * 100)
    if pct >= 90:
        return f"🟢 **{pct}**"
    elif pct >= 50:
        return f"🟡 **{pct}**"
    else:
        return f"🔴 **{pct}**"

def main():
    parser = argparse.ArgumentParser(description="Generate Lighthouse markdown summary.")
    parser.add_argument("report_dir", help="Directory containing Lighthouse CI reports")
    parser.add_argument("--device", default="desktop", help="Device type (mobile/desktop)")
    parser.add_argument("--output", help="Output markdown file path")
    args = parser.parse_args()

    manifests = glob.glob(os.path.join(args.report_dir, "manifest.json"))
    device_icon = "📱 Mobile" if args.device == "mobile" else "🖥️ Desktop"
    
    lines = [
        f"### 🚦 Lighthouse CI Report ({device_icon})",
        "",
        "| URL | Device | Performance | Accessibility | Best Practices | SEO | Full Report |",
        "| :--- | :---: | :---: | :---: | :---: | :---: | :---: |"
    ]

    if not manifests:
        lines.append("| *No reports found* | - | - | - | - | - | - |")
    else:
        with open(manifests[0], "r", encoding="utf-8") as f:
            manifest = json.load(f)

        # Look for median or representative runs
        for entry in manifest:
            if entry.get("isRepresentativeRun") or entry.get("representative"):
                url = entry.get("url", "/")
                json_path = entry.get("jsonPath")
                links = entry.get("links", {})
                html_url = links.get("html") or links.get("url") or "#"

                if json_path and os.path.exists(json_path):
                    with open(json_path, "r", encoding="utf-8") as jf:
                        data = json.load(jf)
                    cats = data.get("categories", {})
                    perf = score_badge(cats.get("performance", {}).get("score"))
                    a11y = score_badge(cats.get("accessibility", {}).get("score"))
                    bp = score_badge(cats.get("best-practices", {}).get("score"))
                    seo = score_badge(cats.get("seo", {}).get("score"))
                else:
                    perf = a11y = bp = seo = "N/A"

                report_link = f"[View Report]({html_url})" if html_url != "#" else "Local report"
                lines.append(f"| `{url}` | {device_icon} | {perf} | {a11y} | {bp} | {seo} | {report_link} |")

    content = "\n".join(lines) + "\n"
    if args.output:
        with open(args.output, "w", encoding="utf-8") as f:
            f.write(content)
    else:
        sys.stdout.write(content)

if __name__ == "__main__":
    main()
