React = require('react/addons')
classNames = require('classnames')

WeddingPage = React.createClass
  render: ->
    <div id="wedding-page" className='sub-content-page'>
      <h3 className='content-page-header'>
        Pescadero Wedding
      </h3>
      <div className='itinerary'>
        <div className='itinerary-content'>
          <h4 className='itinerary-date'>
            Thursday, OCTOBER 29th
          </h4>
          <ul className='wedding-itinerary-list'>
            <li className='wedding-itinerary-item'>
              <span className='itinerary-time'>
                7:00 PM
              </span>
              Welcome Drinks at the Beach
            </li>
          </ul>
        </div>
        <div className='itinerary-content'>
          <h4 className='itinerary-date'>
            Friday, OCTOBER 30th
          </h4>
          <ul className='wedding-itinerary-list'>
            <li className='wedding-itinerary-item'>
              <span className='itinerary-time'>
                9:00 AM
              </span>
              Morning Adventure (TBD)
            </li>
            <li className='wedding-itinerary-item'>
              <span className='itinerary-time'>
                4:00 PM
              </span>
              Wedding Rehearsal in Butano SP
            </li>
            <li className='wedding-itinerary-item'>
              <span className='itinerary-time'>
                6:00 PM
              </span>
              Rehearsal Dinner (TBD)
            </li>
          </ul>
        </div>
        <div className='itinerary-content'>
          <h4 className='itinerary-date'>
            Saturday, OCTOBER 31st
          </h4>
          <ul className='wedding-itinerary-list'>
            <li className='wedding-itinerary-item'>
              <span className='itinerary-time'>
                MORNING
              </span>
              Yoga at Costanoa
            </li>
            <li className='wedding-itinerary-item'>
              <span className='itinerary-time'>
                3:30 PM
              </span>
              Wedding Ceremony in Butano SP
            </li>
            <li className='wedding-itinerary-item'>
              <span className='itinerary-time'>
                6:00 PM
              </span>
              Wedding Reception at Pie Ranch
            </li>
          </ul>
        </div>
        <div className='itinerary-content'>
          <h4 className='itinerary-date'>
            Sunday, NOVEMBER 1st
          </h4>
          <ul className='wedding-itinerary-list'>
            <li className='wedding-itinerary-item'>
              <span className='itinerary-time'>
                TOO EARLY
              </span>
              Newlywed Brunch (TBD)
            </li>
          </ul>
        </div>
      </div>
    </div>

module.exports = WeddingPage
