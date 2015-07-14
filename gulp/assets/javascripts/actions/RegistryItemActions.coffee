alt = require('../alt')
require('es6-promise').polyfill()
require('isomorphic-fetch')

class RegistryItemActions
  fetchRegistryItems: ->
    @dispatch()
    fetch("registry_items.json", {
      method: 'GET'
      credentials: 'same-origin'
      headers:
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
    })
      .then (response) => response.json()
      .then (registryItems) => @actions.updateRegistryItems(registryItems)
      .catch (errorMessage) => @actions.registryItemsFailed(errorMessage)

  editRegistryItem: (item, purchaserName) ->
    @dispatch()
    itemID = item.get('id')
    itemParams =
      registry_item:
        id: itemID
        purchased: true
        purchaser_name: purchaserName
    fetch("registry_items/#{itemID}.json", {
      method: 'PUT'
      body: JSON.stringify(itemParams)
      credentials: 'same-origin'
      headers:
        'Accept': 'application/json'
        'Content-Type': 'application/json'
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
    })
      .then (response) => response.json()
      .then (registryItem) => @actions.updateRegistryItems(registryItem)
      .catch (errorMessage) => @actions.registryItemsFailed(errorMessage)

  updateRegistryItems: (registryItems) ->
    @dispatch(registryItems)

  registryItemsFailed: (errorMessage) ->
    @dispatch(errorMessage)

module.exports = alt.createActions(RegistryItemActions)
