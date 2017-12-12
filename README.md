# Health Decoder

Service to help people utilize and understand their health insurance plans.

< https://health-insurance-decoder.herokuapp.com/ >

## Motivation

Health care in the United States is expensive and complex.  In 2015, individuals in the U.S. spent roughly $9,990 on health-related expenses, 32% of which was for hospital care. We sought to create an app to help users better utilized the health care options available to them by better informing them about their own symptoms and the things that can help them, as well as the presence and affordability of local medical services.


## Key Features

The Health Decoder is a combination of three key features: a self-diagnostic tool, a patient health log, and a health care resources hub.  The self-diagnostic tool and select health care resources can be utilized by any new or outside visitor.  Visitors can sign up for a user account to receive access to personalized tools such as health care logs with data analytics tools and a health insurance deductible calculator.

### Quick Diagnosis

The quick diagnosis tool is an interactive body diagram with clickable parts for targeting symptoms and generating suggestions for possible ailments.  Users can enter an unlimited number of symptoms from and receive a range of ailments with percentages of how likely the ailment is depending on the symptoms provided by the user.

### Health Log

The health log is a personalized record of the user’s symptoms and treatments displayed in an easy-to-read scrolling log and calendar format.  Each symptom log entry consists of a name, a subjective severity rating, and the date that the symptom was logged.  Symptom severity is a discrete integer scale where symptoms with lower ratings are considered to be less severe that symptoms with higher ratings.  Detailed descriptions of the subjective pain scale are listed in the app’s Healthcare Resources section.  

### Health Resources

The resources category of our application is a hub for useful health care information. The Emergency Level tab is a static page with tips from the Health Center for patients who are trying to decide if their symptoms are severe enough to warrant a trip to the hospital.  The Pain Chart tab is a static page that displays the subjective pain scale to provide useful context for users attempting to assess their own symptom severity.  Users can search for urgent and non-urgent health care services under the Nearby Clinics tab, which provides a Google Maps interface.  The search can be carried out relative the user’s current position or a manually entered location.  The Events tab pulls health related events from the Brandeis University events RSS feed.The Student Groups tab is a static page displaying information and links pertaining to all health related student groups on Brandeis University campus. 

Users who have created a profile can also access a copay calculator tool. This tool incorporates information from the user’s plan, informing them of their maximum deductible for both in network and out of network services, as well as the various categories of treatments covered by their plan, and can inform a user about the expected out of pocket costs for a given service.


## Technology

The Health Decoder was created using Ruby on Rails, as well as numerous other tools and assets. We incorporated Ajax into our design in order to accomplish smooth transitions between tabs on the resources and logs pages, as well as to provide feedback on the copay calculator page and quick diagnosis page. We used Material Designs to style the majority of our application’s components such as buttons, sliders, tabs, headers, and tooltips. Our quick diagnosis page was powered by ApiMedic and their vast database of symptoms and diagnosis tools. We also integrated Google maps into the resources page, along with the Brandeis campus RSS feed. We utilized Codeship to accomplish automated testing and deployment of our code.


## Moving Forward

We would like to further customize the app to have different flavors pertinent to other academic institutions outside of Brandeis University, companies, or unaffiliated users.  We would like to customize the MedicAPI code to provide a more streamlined experience and integrate directly into the health log.  The health log symptoms list would be populated by symptoms taken from MedicAPI.
