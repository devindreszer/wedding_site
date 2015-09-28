React = require('react/addons')
Immutable = require('immutable')
classNames = require('classnames')

RegistryItemActions = require('../actions/RegistryItemActions')
RegistryItemStore = require('../stores/RegistryItemStore')

RegistrySection = React.createClass
  getInitialState: ->
    registryItems: Immutable.List()
    showDetailsID: undefined
    fulfillmentConfirmationID: undefined
    purchaserName: undefined

  componentDidMount: ->
    RegistryItemStore.listen(@onChange)
    RegistryItemActions.fetchRegistryItems()

  componentWillUnmount: ->
    RegistryItemStore.unlisten(@onChange)

  onChange: ->
    @setState registryItems: RegistryItemStore.getItemsByPurchased()

  showItemDetails: (item) ->
    @setState showDetailsID: item.get('id') unless item.get('purchased')

  hideItemDetails: (item) ->
    @setState showDetailsID: undefined

  handleInputChange: (event) ->
    @setState purchaserName: event.target.value

  submitFulfillment: (event, item) ->
    event.preventDefault()
    @setState fulfillmentConfirmationID: item.get('id')

  cancelConfirmFulfillment: (event) ->
    event.preventDefault()
    @setState fulfillmentConfirmationID: undefined

  handleConfirmFulfillment: (event, item) ->
    event.preventDefault()
    if @state.purchaserName
      RegistryItemActions.editRegistryItem(item, @state.purchaserName)
    else
      alert('To confirm your fulfillment and to help the bride and groom send thank you cards, please enter your name.')

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
      <div className='registry-honeymoon-house'>
        <div className='registry-honeymoon-house-text'>
          {"Still can't find the right gift? We greatly appreciate any assistance with our new house or honeymoon in St. Lucia."}
        </div>
        <div>Venmo: @lindseymfontana</div>
        <div>PayPal: lindseymfontana@gmail.com</div>
        <div className='location-section'>
          <div className='location-container'>
            <div className='location-image-container house'>
            </div>
          </div>
          <div className='location-container'>
            <div className='location-image-container honeymoon'>
            </div>
          </div>
        </div>
      </div>
      <div className='registry-address-section'>
        <div className='registry-address'>
          Lindsey Fontana & Devin Dreszer<br/>
          41 Silver Spruce<br/>
          Boulder, CO 80302<br/>
        </div>
      </div>
    </div>

  renderRegistryItem: (item) ->
    liClasses = classNames
      'registry-item': true
      'fulfilled': item.get('purchased')
    modal = @renderModalItem(item) if @state.showDetailsID == item.get('id')
    <li
      key={item.get('id')}
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
          {@renderFulfillmentSection(item)}
        </div>
      </div>
    </div>

  renderFulfillmentSection: (item) ->
    if item.get('purchased')
      <div className='registry-item-fulfillment'>
        Fulfilled
      </div>
    else if @state.fulfillmentConfirmationID == item.get('id')
      <div className='registry-item-confirm-fulfillment'>
        To confirm your fulfillment and to help the bride and groom send thank you cards,
         please enter your name.
        <form>
          <input
            type="text"
            id="purchaser-name"
            className="purchaser-name-input"
            placeholder="Please Enter Your Name"
            onChange={@handleInputChange}
            value={@state.purchaserName} />
          <div className='purchaser-name-btn-container'>
            <button
              name="button"
              id="purchaser-name-cancel"
              className="purchaser-name-btn cancel-btn"
              onClick={@cancelConfirmFulfillment}>
              Cancel
            </button>
            <button
              name="button"
              type="submit"
              id="purchaser-name-submit"
              className="purchaser-name-btn submit-btn"
              onClick={() => @handleConfirmFulfillment(event, item)}>
              Confirm
            </button>
          </div>
        </form>
      </div>
    else
      <a href='#'
        onClick={() => @submitFulfillment(event, item)}
        className='registry-item-fulfillment'>
        Mark as Fulfilled
      </a>


module.exports = RegistrySection
