ConfigureMailer.Initializer =
  exec: (pageName) ->
    if pageName && ConfigureMailer[pageName]
      ConfigureMailer[pageName]['init']()

  currentPage: ->
    return '' unless $('body').attr('id')

    bodyId      = $('body').attr('id').split('-')
    action      = ConfigureMailer.Util.capitalize(bodyId[1])
    controller  = ConfigureMailer.Util.capitalize(bodyId[0])
    controller + action

  init: ->
    ConfigureMailer.Initializer.exec('Common')
    if @currentPage()
      ConfigureMailer.Initializer.exec(@currentPage())

$(document).on 'ready page:load', ->
  ConfigureMailer.Initializer.init()