function qwen
    if test (count  $argv) -eq 0
        echo "用法: qwen <你的问题>"
        return 1
    end

    set -l content (string join " "  $argv)

    if not set -q DASHSCOPE_API_KEY
        echo "错误: 请设置 DASHSCOPE_API_KEY 环境变量" >&2
        return 1
    end

    # 构造 JSON（安全转义双引号）
    set -l json "{\"model\":\"qwen-max\",\"input\":{\"messages\":[{\"role\":\"user\", \"content\":\"$content\"}]}}"

    curl -s https://dashscope.aliyuncs.com/api/v1/services/aigc/text-generation/generation \
        -H "Authorization: Bearer  $DASHSCOPE_API_KEY" \
        -H "Content-Type: application/json" \
        -d $json | jq -r '
        if .output.text // empty then .output.text
        elif .message // empty then .message
        else "❌ API 返回异常，请检查。\n原始响应:\n  $ .)"
        end'
end
