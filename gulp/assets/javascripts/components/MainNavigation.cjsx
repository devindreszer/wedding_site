React = require('react/addons')
classNames = require('classnames')

MainNavigation = React.createClass
  handleNavSelection: (event) ->
    content = event.target.dataset.navOption
    @props.setContent(content)

  render: ->
    home =
      name: 'home'
      content: 'The Date'
      clickHandler: @handleNavSelection
    lodging =
      name: 'lodging'
      content: 'Lodging'
      clickHandler: @handleNavSelection
    optionsList = [home, lodging]
    navOptions = optionsList.map(@renderNavOption)
    <div id="main-navigation">
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
