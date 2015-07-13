React = require('react/addons')
$ = require('jquery')
classNames = require('classnames')

RegistrySection = React.createClass
  getInitialState: ->
    registryItems: []
    errorMessage: undefined

  componentDidMount: ->
    @fetchRegistryItems()

  fetchRegistryItems: ->
    fetch("registry_items.json", {
      method: 'GET'
      credentials: 'same-origin'
      headers:
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
    })
      .then (response) => response.json()
      .then (registryItems) => @setRegistryItems(registryItems)
      .catch (errorMessage) => @setErrorMessage(errorMessage)

  handleFulfillment: (event, item) ->
    @updateRegistryItem(event, item)

  itemParams: (item) ->
    registry_item:
      id: item.id
      purchased: true

  setRegistryItems: (registryItems) ->
    @setState registryItems: registryItems

  setErrorMessage: (errorMessage) ->
    @setState errorMessage: errorMessage

  updateRegistryItem: (event, item) ->
    event.preventDefault()
    fetch("registry_items/#{item.id}.json", {
      method: 'PUT'
      body: JSON.stringify(@itemParams(item))
      credentials: 'same-origin'
      headers:
        'Accept': 'application/json'
        'Content-Type': 'application/json'
        'X-CSRF-Token': document.querySelector('meta[name=csrf-token]').getAttribute('content')
    })
      .then (response) => response.json()
      .then (registryItem) => alert(registryItem)
      .catch (errorMessage) => alert(errorMessage)

  render: ->
    registryItems = if @state.registryItems.length > 0
      @state.registryItems.map(@renderRegistryItem)
    <div id='registry-section'>
      <div className='header-section'>
        <div className='header-image registry-header'>
        </div>
      </div>
      <div className='registry-container'>
        <ul className='registry-items'>
          {registryItems}
        </ul>
      </div>
    </div>

  renderRegistryItem: (item) ->
    <li className='registry-item'>
      <div className='registry-item-name'>{item.name}</div>
      <a href='#' onClick={() => @handleFulfillment(event, item)}>Fulfilled</a>
    </li>

module.exports = RegistrySection
