jQuery(document).on 'turbolinks:load', ->
  comments = $('#comments')
  console.log('Comments count = ' + comments.length)
  
  $('#new_comment').submit (event) ->
    console.log('Submit pressed')
    $this = $(this)
    textarea = $this.find('#comment_content')
    if $.trim(textarea.val()).length > 1
      console.log('Have text comment')
      App.global_chat.send_comment(textarea.val(), comments.data('blog-id'))
      textarea.val('')
    event.preventDefault()
    return false

  if comments.length > 0
    console.log('We already have comments')
    App.global_chat = App.cable.subscriptions.create {
      channel: 'BlogsChannel'
      blog_id: comments.data('blog-id')
    },
    connected: ->
      console.log('Were connected')
    disconnected: ->
      console.log('Were disconnected')
    received: (data) ->
      console.log('Received some data')
      comments.append data['comment']
    send_comment: (comment, blog_id) ->
      console.log('sending comment')
      @perform 'send_comment', comment: comment, blog_id: blog_id
