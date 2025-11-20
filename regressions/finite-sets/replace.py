#!/usr/bin/env python3
"""
Replace tokens in .smt2 files:
- Set -> FiniteSet
- singleton -> set.singleton (only if not already set.singleton)
- union -> set.union (only if not already set.union)
- card -> set.size (only if not already set.size)

Usage:
  python replace_smt2_tokens.py /path/to/dir [--dry-run] [--backup] [--ext .smt2]
"""

import argparse
import os
import re
from pathlib import Path

def compile_patterns():
    # Word-boundary match for 'Set' (capital S), replace with 'FiniteSet'
    p_set = (re.compile(r"\bSet\b"), "FiniteSet")

    # Avoid replacing when already prefixed by 'set.' using negative lookbehind
    # Note: Python's regex engine supports variable-length lookbehind if fixed length; here it's fixed 'set.'.
    p_singleton = (re.compile(r"(?<!set\.)\bsingleton\b"), "set.singleton")
    p_union     = (re.compile(r"(?<!set\.)\bunion\b"), "set.union")
    p_card      = (re.compile(r"(?<!set\.)\bcard\b"), "set.size")

    return [p_set, p_singleton, p_union, p_card]

def process_text(text, patterns):
    changed = False
    for rx, repl in patterns:
        new_text, n = rx.subn(repl, text)
        if n > 0:
            changed = True
            text = new_text
    return text, changed

def main():
    ap = argparse.ArgumentParser(description="Replace tokens in .smt2 files safely.")
    ap.add_argument("root", help="Root directory to search recursively.")
    ap.add_argument("--ext", default=".smt2", help="File extension to match (default: .smt2).")
    ap.add_argument("--dry-run", action="store_true", help="Show what would change without writing files.")
    ap.add_argument("--backup", action="store_true", help="Write a .bak file with original content before modifying.")
    args = ap.parse_args()

    root = Path(args.root).resolve()
    if not root.is_dir():
        raise SystemExit(f"Error: {root} is not a directory")

    patterns = compile_patterns()
    total_files = 0
    changed_files = 0

    for path in root.rglob(f"*{args.ext}"):
        if not path.is_file():
            continue
        total_files += 1
        try:
            text = path.read_text(encoding="utf-8")
        except UnicodeDecodeError:
            # Fallback: read as latin-1 to avoid crash on odd encodings
            text = path.read_text(encoding="latin-1")

        new_text, changed = process_text(text, patterns)

        if changed:
            changed_files += 1
            if args.dry_run:
                print(f"[DRY-RUN] Would modify: {path}")
            else:
                if args.backup:
                    backup_path = Path(str(path) + ".bak")
                    backup_path.write_text(text, encoding="utf-8")
                path.write_text(new_text, encoding="utf-8")
                print(f"Modified: {path}")

    print(f"\nScanned {total_files} file(s). {'Changed ' + str(changed_files) + ' file(s).' if changed_files else 'No changes needed.'}")

if __name__ == "__main__":
    main()