$ ->
  styleguideHtml = $('.styleguide-html')
  htmlContainer = $(('.styleguide-html pre code'))
  htmlContainer.attr('id', 'code')
  button = "<button class='btn' data-clipboard-target='code'><i class='fa fa-clipboard'></i> Copy to Clipboard</button>"

  styleguideHtml.append(button)

  client = new ZeroClipboard($('.styleguide-block .btn'))
  client.setHtml htmlContainer
