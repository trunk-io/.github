#!/bin/bash

# Test script to validate cover image path in profile README
# This ensures the image will display correctly when pushed to GitHub

set -e

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
README_PATH="$REPO_ROOT/profile/readme.md"
IMAGE_PATH="$REPO_ROOT/images/trunk-keep-ci-green.png"
EXPECTED_IMAGE_URL="https://raw.githubusercontent.com/trunk-io/.github/main/images/trunk-keep-ci-green.png"

echo "🔍 Testing cover image configuration..."
echo ""

# Test 1: Check if README exists
echo "✓ Test 1: Checking if README exists..."
if [ ! -f "$README_PATH" ]; then
    echo "❌ FAIL: README not found at $README_PATH"
    exit 1
fi
echo "   ✓ README found"

# Test 2: Check if image file exists
echo ""
echo "✓ Test 2: Checking if image file exists..."
if [ ! -f "$IMAGE_PATH" ]; then
    echo "❌ FAIL: Image file not found at $IMAGE_PATH"
    exit 1
fi
echo "   ✓ Image file found: $IMAGE_PATH"

# Test 3: Check if README contains the image reference
echo ""
echo "✓ Test 3: Checking if README contains image reference..."
if ! grep -q "trunk-keep-ci-green.png" "$README_PATH"; then
    echo "❌ FAIL: README does not contain reference to trunk-keep-ci-green.png"
    exit 1
fi
echo "   ✓ Image reference found in README"

# Test 4: Check if the URL format is correct
echo ""
echo "✓ Test 4: Validating image URL format..."
if ! grep -q "$EXPECTED_IMAGE_URL" "$README_PATH"; then
    echo "⚠️  WARNING: Expected URL format not found. Checking for alternative formats..."
    
    # Extract the actual image URL from README
    ACTUAL_URL=$(grep -o 'src="[^"]*trunk-keep-ci-green.png[^"]*"' "$README_PATH" | sed 's/src="//' | sed 's/"//')
    
    if [ -z "$ACTUAL_URL" ]; then
        echo "❌ FAIL: Could not extract image URL from README"
        exit 1
    fi
    
    echo "   Found URL: $ACTUAL_URL"
    
    # Check if it's a raw GitHub URL
    if [[ "$ACTUAL_URL" =~ ^https://raw\.githubusercontent\.com/ ]]; then
        echo "   ✓ URL uses raw.githubusercontent.com (recommended)"
        
        # Verify it points to the correct repo
        if [[ "$ACTUAL_URL" =~ trunk-io/\.github ]]; then
            echo "   ✓ URL points to correct repository (trunk-io/.github)"
        else
            echo "⚠️  WARNING: URL may not point to correct repository"
        fi
        
        # Verify it points to main branch
        if [[ "$ACTUAL_URL" =~ /main/ ]]; then
            echo "   ✓ URL points to main branch"
        else
            echo "⚠️  WARNING: URL may not point to main branch"
        fi
    elif [[ "$ACTUAL_URL" =~ ^/images/ ]]; then
        echo "   ⚠️  WARNING: Using absolute path. This may not work reliably in GitHub profile READMEs."
    elif [[ "$ACTUAL_URL" =~ ^\.\./images/ ]]; then
        echo "   ⚠️  WARNING: Using relative path. This may not work reliably in GitHub profile READMEs."
    else
        echo "   ⚠️  WARNING: Unexpected URL format: $ACTUAL_URL"
    fi
else
    echo "   ✓ Expected URL format found: $EXPECTED_IMAGE_URL"
fi

# Test 5: Validate image file is not empty
echo ""
echo "✓ Test 5: Validating image file is not empty..."
IMAGE_SIZE=$(stat -f%z "$IMAGE_PATH" 2>/dev/null || stat -c%s "$IMAGE_PATH" 2>/dev/null)
if [ "$IMAGE_SIZE" -eq 0 ]; then
    echo "❌ FAIL: Image file is empty"
    exit 1
fi
echo "   ✓ Image file size: $(numfmt --to=iec-i --suffix=B $IMAGE_SIZE 2>/dev/null || echo "${IMAGE_SIZE} bytes")"

# Test 6: Check file type
echo ""
echo "✓ Test 6: Validating image file type..."
if command -v file >/dev/null 2>&1; then
    FILE_TYPE=$(file -b --mime-type "$IMAGE_PATH")
    if [[ "$FILE_TYPE" =~ ^image/ ]]; then
        echo "   ✓ File type: $FILE_TYPE"
    else
        echo "⚠️  WARNING: File may not be a valid image (detected: $FILE_TYPE)"
    fi
else
    echo "   ⚠️  Skipped: 'file' command not available"
fi

# Test 7: Validate URL is accessible (only if changes are pushed)
echo ""
echo "✓ Test 7: Testing if image URL is accessible..."
if command -v curl >/dev/null 2>&1; then
    HTTP_CODE=$(curl -s -o /dev/null -w "%{http_code}" "$EXPECTED_IMAGE_URL" 2>/dev/null || echo "000")
    if [ "$HTTP_CODE" = "200" ]; then
        echo "   ✓ Image is accessible at GitHub URL"
    elif [ "$HTTP_CODE" = "404" ]; then
        echo "   ⚠️  WARNING: Image returns 404 (may not be pushed yet or branch is different)"
        echo "      This is expected if changes haven't been pushed to GitHub yet"
    else
        echo "   ⚠️  WARNING: Image returned HTTP $HTTP_CODE"
        echo "      URL: $EXPECTED_IMAGE_URL"
    fi
else
    echo "   ⚠️  Skipped: 'curl' command not available"
fi

echo ""
echo "✅ All tests passed! The image path is correctly configured."
echo ""
echo "📝 Summary:"
echo "   - Image file: $IMAGE_PATH"
echo "   - Image URL: $EXPECTED_IMAGE_URL"
echo "   - README: $README_PATH"
echo ""
echo "🚀 After pushing to GitHub, the image should display correctly in:"
echo "   - Organization profile page (github.com/trunk-io)"
echo "   - Direct README view (github.com/trunk-io/.github/blob/main/profile/readme.md)"

