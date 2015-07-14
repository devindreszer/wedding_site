React = require('react/addons')
Immutable = require('immutable')
classNames = require('classnames')

RegistryItemActions = require('../actions/RegistryItemActions')
RegistryItemStore = require('../stores/RegistryItemStore')

RegistrySection = React.createClass
  getInitialState: ->
    registryItems: Immutable.Map({})
    errorMessage: undefined
    isLoading: undefined
    showDetailsID: undefined

  componentDidMount: ->
    RegistryItemStore.listen(@onChange)
    RegistryItemActions.fetchRegistryItems()

  componentWillUnmount: ->
    RegistryItemStore.unlisten(@onChange)

  onChange: ->
    @setState RegistryItemStore.getState()

  showItemDetails: (item) ->
    @setState showDetailsID: item.get('id') unless item.get('purchased')

  hideItemDetails: (item) ->
    @setState showDetailsID: undefined

  handleFulfilled: (event, item) ->
    event.preventDefault()
    RegistryItemActions.editRegistryItem(item)

  render: ->
    registryItems = if @state.registryItems.size > 0
      @state.registryItems.map(@renderRegistryItem)
    <div id='registry-section'>
      <div className='registry-custom'>
        <div className='header-section'>
          <div className='header-image registry-header'>
          </div>
        </div>
        <ul className='registry-items'>
          {registryItems}
        </ul>
      </div>
      <div className='registry-sur-la-table'>
        <div className='registry-sur-la-table-text'>
          {"Can't find the right gift? We are also registered at:"}
        </div>
        <a href='http://www.surlatable.com/registry/giftRegistryList.jsp?id=2001240622186'
          className='registry-container'
          target='_blank'>
        </a>
      </div>
    </div>

  renderRegistryItem: (item) ->
    liClasses = classNames
      'registry-item': true
      'fulfilled': item.get('purchased')
    modal = @renderModalItem(item) if @state.showDetailsID == item.get('id')
    <li
      className={liClasses}
      onMouseEnter={() => @showItemDetails(item)}
      onMouseLeave={() => @hideItemDetails(item)}>
      {modal}
      {@renderRegistryItemCard(item)}
    </li>

  renderModalItem: (item) ->
    <div className='registry-item-modal'>
      {@renderRegistryItemCard(item)}
    </div>

  renderRegistryItemCard: (item) ->
    retailerLink = if item.get('link')
      <a
        href={item.get('link')}
        className='registry-item-retailer'
        target='_blank'>
        {item.get('retailer')}
      </a>
    else
      <div className='registry-item-retailer'>{item.get('retailer')}</div>
    fulfillment = if item.get('purchased')
      <div className='registry-item-fulfillment'>
        Fulfilled
      </div>
    else
      <a
        href='#'
        onClick={() => @handleFulfilled(event, item)}
        className='registry-item-fulfillment'>
        Mark as Fulfilled
      </a>
    <div className='registry-item-card'>
      <div className='registry-item-image' style={backgroundImage: "url('#{item.get('image_url')}')"}></div>
      <div className='registry-item-info'>
        <div className='registry-item-name'>{item.get('name')}</div>
        <div className='registry-item-details'>
          {retailerLink}
          <div className='registry-item-price'>{"$#{item.get('price')}0"}</div>
        </div>
        <div className='registry-item-description'>
          {item.get('description')}
        </div>
        <div className='registry-item-fulfillment-container'>
          {fulfillment}
        </div>
      </div>
    </div>

module.exports = RegistrySection
