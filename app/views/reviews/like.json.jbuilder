json.icon render(partial: "shared/likes", formats: :html)
json.count @review.favoritors.count
