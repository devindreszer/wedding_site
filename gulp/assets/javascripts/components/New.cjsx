React = require('react/addons')
$ = require('jquery')
classNames = require('classnames')

RegistrySection = require('./RegistrySection')

New = React.createClass
  render: ->
    <div id='new-app'>
      <header>
        <nav id='desktop-nav'>
          <a className='desktop-nav-item' href='/#our-journey-section'>Our Journey</a>
          <a className='desktop-nav-item' href='/#wedding-section'>Wedding</a>
          <a className='desktop-nav-item' href='/#reception-section'>Reception</a>
          <a className='desktop-nav-item' href='/#photos-section'>Photos</a>
          <a className='desktop-nav-item' href='/#registry-section'>Registry</a>
        </nav>
      </header>
      {@renderHomeSection()}
      {@renderOurJourneySection()}
      {@renderWeddingSection()}
      {@renderReceptionSection()}
      {@renderPhotosSection()}
      {@renderRegistrySection()}
    </div>

  renderHomeSection: ->
    <div id='home-section'>
      <div className='logo-section home-logo-image'>
        <div className='logo-image main-logo large-logo'>
        </div>
      </div>
    </div>

  renderOurJourneySection: ->
    <div id='our-journey-section'>
      <div className='header-section'>
        <div className='header-image our-journey-header'>
        </div>
      </div>
      <div className='map-container'>
        <div className='map-image'>
          <div className='map-image-container'>
          </div>
        </div>
        <div className='map-legend'>
        </div>
      </div>
    </div>

  renderWeddingSection: ->
    <div id='wedding-section'>
      <div className='logo-section wedding-logo-image'>
        <div className='logo-image wedding-logo large-logo'>
        </div>
      </div>
      <div className='header-section'>
        <div className='header-image wedding-header'>
        </div>
      </div>
      <div className='text-section'>
        {"On their fifth date on a hike in Butano State Park,
         Devin said that they would one day get married in that exact spot.
         It was pretty awkward, but Lindsey kind of liked the sound of it too.
         Nearly four years later, Devin's prediction is going to come true."}
      </div>
      <div className='location-section'>
        <div className='location-container'>
          <div className='location-image-container ceremony-site'>
          </div>
          <div className='location-text-section'>
            <div className='location-text-header'>Ceremony</div>
            <div className='location-text'>
              SATURDAY October 31, 2015 at 3:30pm<br/>
              Butano State Park<br/>
              Pescadero, CA<br/>
            </div>
          </div>
        </div>
        <div className='location-container'>
          <div className='location-image-container reception-site'>
          </div>
          <div className='location-text-section'>
            <div className='location-text-header'>Reception</div>
            <div className='location-text'>
              SATURDAY October 31, 2015 at 6:00pm<br/>
              Pie Ranch, 2080 Cabrillo Highway<br/>
              Pescadero, CA<br/>
            </div>
          </div>
        </div>
      </div>
      <div className='wedding-details-section'>
        <div className='text-section'>
          {"We would love it if our ceremony reflected the love and support that
           we get from all of you.  Please let us know if you would like to share
           something during the ceremony.  It can be anything - a reading, a
           musical performance, a memory, well wishes, etc."}
        </div>
        <div className='text-section'>
          {"We will be doing a lot of walking on uneven dirt surfaces during the
           ceremony, cocktail hour, and reception, so shoes that are more
           comfortable or give better traction might be helpful. Bay Area weather
           can be quite unpredictable in the evenings, so it may also be good to
           have layering options in case it gets chilly."}
        </div>
      </div>
      <div className='itinerary-section'>
      </div>
    </div>

  renderReceptionSection: ->
    <div id='reception-section'>
      <div className='logo-section'>
        <div className='logo-image reception-logo large-logo'>
        </div>
      </div>
      <div className='header-section'>
        <div className='header-image reception-header'>
        </div>
      </div>
      <div className='text-section'>
        {"We will be celebrating our marriage with friends and family at Janet
         and Peter Fontana's in Wrentham, MA in May 2016.  More details to come
         after our wedding ceremony."}
      </div>
    </div>

  renderPhotosSection: ->
    <div id='photos-section'>
      <div className='header-section'>
        <div className='header-image photos-header'>
        </div>
      </div>
      <div className='photos-container'>
        <div className='main-container row'>
          <div className='large-column-40 small-column-80'>

            <div className='row'>
              <div className='photo-box large-box-20 small-box-40'>
              </div>
              <div className='photo-box large-box-20 small-box-40'>
              </div>
            </div>

            <div className='row'>
              <div className='photo-box large-box-27 small-box-53'>
              </div>
              <div className='large-column-13 small-column-27'>
                <div className='photo-box large-box-13 small-box-27'>
                </div>
                <div className='photo-box large-box-13 small-box-27'>
                </div>
              </div>
            </div>

            <div className='row'>
              <div className='photo-box large-box-20 small-box-40'>
              </div>
              <div className='photo-box large-box-20 small-box-40'>
              </div>
            </div>

            <div className='row'>
              <div className='photo-box large-box-13 small-box-27'>
              </div>
              <div className='photo-box large-box-13 small-box-27'>
              </div>
              <div className='photo-box large-box-13 small-box-27'>
              </div>
            </div>
          </div>

          <div className='large-column-40 small-column-80'>
            <div className='row'>
              <div className='photo-box large-box-13 small-box-27'>
              </div>
              <div className='photo-box large-box-13 small-box-27'>
              </div>
              <div className='photo-box large-box-13 small-box-27'>
              </div>
            </div>

            <div className='row'>
              <div className='photo-box large-box-20 small-box-40'>
              </div>
              <div className='photo-box large-box-20 small-box-40'>
              </div>
            </div>

            <div className='row'>
              <div className='photo-box large-box-20 small-box-40'>
              </div>
              <div className='photo-box large-box-20 small-box-40'>
              </div>
            </div>

            <div className='row'>
              <div className='large-column-13 small-column-27'>
                <div className='photo-box large-box-13 small-box-27'>
                </div>
                <div className='photo-box large-box-13 small-box-27'>
                </div>
              </div>
              <div className='photo-box large-box-27 small-box-53'>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  renderRegistrySection: ->
    <RegistrySection />

module.exports = New
