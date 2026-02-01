#!/bin/bash

echo "🔍 Generating changed file list..."
diff -qr codebase/previous codebase/current > inputs/code-diff/changed_files.txt

echo "✅ Changed file list created at inputs/code-diff/changed_files.txt"
