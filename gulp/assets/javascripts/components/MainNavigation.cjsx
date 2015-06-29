React = require('react/addons')
classNames = require('classnames')

MainNavigation = React.createClass
  handleNavSelection: (event) ->
    content = event.target.dataset.navOption
    @props.setContent(content)

  render: ->
    home =
      name: 'home'
      content: 'Home'
      clickHandler: @handleNavSelection
    ourStory =
      name: 'ourStory'
      content: 'Our Story'
      clickHandler: @handleNavSelection
    wedding =
      name: 'wedding'
      content: 'Pescadero Wedding'
      clickHandler: @handleNavSelection
    reception =
      name: 'reception'
      content: 'Wrentham Reception'
      clickHandler: @handleNavSelection
    registry =
      name: 'registry'
      content: 'Registry'
      clickHandler: @handleNavSelection
    photos =
      name: 'photos'
      content: 'Photos'
      clickHandler: @handleNavSelection
    optionsList = [home, ourStory, wedding, reception, registry, photos]
    navOptions = optionsList.map(@renderNavOption)
    classes = classNames
      'active': @props.isActive
    <div id="main-navigation" className={classes}>
      <nav id='main-nav'>
        <ul className='main-nav-options'>
          {navOptions}
        </ul>
      </nav>
    </div>

  renderNavOption: (navOption) ->
    liClassObject =
      'main-nav-option': true
    liClassObject["main-nav-#{navOption.name}"]
    liClasses = classNames(liClassObject)
    <li className={liClasses}>
      <a href='#'
        title={navOption.name}
        data-nav-option={navOption.name}
        onClick={navOption.clickHandler}>
        {navOption.content}
      </a>
    </li>


module.exports = MainNavigation
