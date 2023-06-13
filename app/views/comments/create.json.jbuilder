if @comment.persisted?
  json.form render(partial: "concerts/comment_form", formats: :html, locals: { comment: Comment.new, review: @review })
  json.comment render(partial: "concerts/comment", formats: :html, locals: { comment: @comment })
else
  json.form render(partial: "concerts/comment_form", formats: :html, locals: { comment: @comment, review: @review })

end
