React = require('react/addons')
classNames = require('classnames')

MainNavigation = React.createClass
  handleNavSelection: (event) ->
    content = event.target.dataset.navOption
    @props.setContent(content)

  render: ->
    classes = classNames
      'active': @props.isActive
    <div id="main-navigation" className={classes}>
      <nav id='main-nav'>
        Coming in July 2015
      </nav>
    </div>
    # home =
    #   name: 'home'
    #   content: 'Home'
    #   clickHandler: @handleNavSelection
    # activities =
    #   name: 'activities'
    #   content: 'Activities'
    #   clickHandler: @handleNavSelection
    # accomodations =
    #   name: 'accomodations'
    #   content: 'Accomodations'
    #   clickHandler: @handleNavSelection
    # optionsList = [home, activities, accomodations]
    # navOptions = optionsList.map(@renderNavOption)
    # classes = classNames
    #   'active': @props.isActive
    # <div id="main-navigation" className={classes}>
    #   <nav id='main-nav'>
    #     <ul className='main-nav-options'>
    #       {navOptions}
    #     </ul>
    #   </nav>
    # </div>

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
