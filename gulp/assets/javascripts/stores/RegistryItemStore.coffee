alt = require('../alt')
Immutable = require('immutable')
RegistryItemActions = require('../actions/RegistryItemActions')

class RegistryItemStore
  constructor: ->
    @state =
      registryItems: Immutable.Map({})
      errorMessage: null
      isLoading: false
    @exportPublicMethods
      getItemsByPurchased: @getItemsByPurchased
    @bindListeners
      handleEditRegistryItem: RegistryItemActions.EDIT_REGISTRY_ITEM
      handleFetchRegistryItems: RegistryItemActions.FETCH_REGISTRY_ITEMS
      handleUpdateRegistryItems: RegistryItemActions.UPDATE_REGISTRY_ITEMS
      handleRegistryItemsFailed: RegistryItemActions.REGISTRY_ITEMS_FAILED

  getItemsByPurchased: ->
    @state.registryItems.toList().sort (a, b) ->
      if a.get('purchased') == b.get('purchased')
        0
      else if a.get('purchased')
        1
      else
        -1

  handleEditRegistryItem: ->
    @setState
      errorMessage: null
      isLoading: true

  handleFetchRegistryItems: ->
    @setState
      errorMessage: null
      isLoading: true

  handleUpdateRegistryItems: (registryItems) ->
    newItems = {}
    registryItems = [registryItems] unless registryItems.length
    for registryItem in registryItems
      newItems[registryItem.id] = registryItem
    @_mergeRegistryItems(newItems)

  handleRegistryItemsFailed: (errorMessage) ->
    @setState
      errorMessage: errorMessage
      isLoading: false

  _mergeRegistryItems: (items) ->
    @setState
      registryItems: @state.registryItems.merge(items)
      isLoading: false

module.exports = alt.createStore(RegistryItemStore, 'RegistryItemStore')
