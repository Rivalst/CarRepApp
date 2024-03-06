# test_2s_app

packedges used:
- BLoC
- Google Map
- Geolocator
- GAP
- shared_preferences
- equatable
- GoRouter
- Octopus

App architecture based on BLoC with Clean Architecture

PROJECT BUILDED ONLY FOR iOS !


There are several navigation methods implemented here depending on the user’s login status:

- main:
  - Here, state checking is implemented only using BLoC without using Navigator, Routes, etc.

- GoRouter:
  - This is where state checking is implemented using only BLoC along with GoRouter.
    git checkout navigation_gorouter - To switch from the main branch to a branch that uses the GoRouter navigation library

- Ocotopus:
  - This is where state checking is implemented using only BLoC along with Octopus navigator.
    git checkout navigation_octopus - To switch from the main branch to a branch that uses the Octopus navigation library
