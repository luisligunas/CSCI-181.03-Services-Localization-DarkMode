# CSCI 181.03 - Services, Localization, and Dark Mode

## Services and Coupling

![Dependency Graph](https://user-images.githubusercontent.com/24354524/225550725-942e1e8e-5607-4713-ac90-4ea274c4125d.jpg)

In the above dependency graph, we can see how the models (i.e., classes, structs, protocols) in our codebase are [coupled](https://en.wikipedia.org/wiki/Coupling_(computer_programming)) with each other. 

A "uses" connection would imply strong coupling between two models. For example, the `ViewController` makes use of a `MovieService`. This means that the `ViewController` _needs_ the `MovieService` to function properly. This is only a one-way dependency though as the `MovieService` does not need the `ViewController` to function properly.

An "implements" connection actually *also* implies strong coupling between two models. For example, the `LocalMovieService` depends on the existence of `MovieService` since the former implements the latter. Similar to the "uses" case, this is also only a one-way dependency. This is because `MovieService` will continue to exist even if `LocalMovieService` doesn't.

---

Given that both types of connections introduce coupling, what's the point of differentiating them?

The point is that if model A uses model B and model B ***uses*** model C, model A would also depend on/be coupled with model C.

On the other hand, if model A uses model B and model B ***implements*** model C, model A would NOT depend on/be coupled with model C. Another way of looking at this is that model A would not need to know about the existence of model C or how it works. The only thing that model A would need to know is how model B works.

This use of protocols allows us to limit the knowledge that we need to know when viewing a model in a codebase.

More concretely, in the above example, `ViewController` would not need to know that `Moya` is being used by the `MoyaAPIService`, which is being used by the `APIMovieService`, which the `ViewController` uses. All that `ViewController` needs to know is how `MovieService` works.

Conversely, in the below example, if we did not use any protocols in our implementation, this is how the dependency graph would look like. In this example, `ViewController` would have to know about the implementation of `APIMovieService` and would transitively have to know about the implementations of `MovieAPI`, `MoyaAPIService`, and `Moya`. This is a much more coupled codebase and would not be very flexible. Modifying functionality in one model would most likely require modifications in a lot of other models.

![Dependency Graph 2](https://user-images.githubusercontent.com/24354524/225550740-e4b142d4-7f21-40b1-97df-7e70c2cec296.jpg)

## Localization

In order to support localization for different languages, we first have to specify our supported languages under the `Localizations` section in our Project Info.

<img width="1118" alt="Screenshot 2023-03-16 at 4 26 54 PM" src="https://user-images.githubusercontent.com/24354524/225558237-4423efd6-e82d-4420-8c5f-e8de22b41fc9.png">

We then create a Strings file to contain our localized strings.

<img width="730" alt="Screenshot 2023-03-16 at 4 29 02 PM" src="https://user-images.githubusercontent.com/24354524/225558776-721f1ae5-4cf0-4039-a8c2-39f046f27c58.png">

After that, we can specify which languages we want to create different localized strings for.

<img width="960" alt="Screenshot 2023-03-16 at 4 28 25 PM" src="https://user-images.githubusercontent.com/24354524/225558676-ad8acbea-c1c9-49c7-9705-b9da76ec903a.png">

We will now have created two `Localizable.strings` files - one for English and one for Spanish. Having different values for the same keys in these two files is how we specify different strings per language.

## Dark Mode

Supporting dark mode is actually very easy. Instead of directly specifying colors by their hexadecimal or RGB values, we first create a Color Set in ours Assets.xcassets file. We then just have to specify different colors for the "Any Appearance" and for "Dark". (The "Any Appearance" colors are what show whenever the device is set to light mode.)

<img width="1019" alt="Screenshot 2023-03-16 at 4 12 11 PM" src="https://user-images.githubusercontent.com/24354524/225554744-41027468-78c5-4821-b78d-0ac3d2affb3e.png">

After that, all we have to do is use that color asset when specifying colors for UI elements.

<img width="642" alt="Screenshot 2023-03-16 at 4 14 25 PM" src="https://user-images.githubusercontent.com/24354524/225555263-54499638-dc25-43d9-b91d-38aae8d52974.png">

Also note that Xcode also has existing "dark mode counterparts" for the default colors that it has available. Even if we don't manually specify any dark mode color counterparts for the `UILabel` text color and the background of the overall `UIView`, these colors automatically change when we move between appearances because they're already provided automatically.

| Light Mode | Dark Mode |
| ----- | ----- |
| <img width="471" alt="Screenshot 2023-03-16 at 4 16 17 PM" src="https://user-images.githubusercontent.com/24354524/225555694-c77d62d7-face-4f07-b1a1-4a683929896f.png"> | <img width="471" alt="Screenshot 2023-03-16 at 4 15 57 PM" src="https://user-images.githubusercontent.com/24354524/225557145-6cf44cb7-2864-4c94-a213-7084070c067c.png"> |

## Swift Package Manager

Apple's recommended way of importing third party libraries into an Xcode project is using Swift Package Manager (SPM). This is built into Xcode unlike package managers like CocoaPods and Carthage.

We can add packages using SPM by going to the Package Dependencies section under the Project. 

<img width="970" alt="Screenshot 2023-03-16 at 4 36 40 PM" src="https://user-images.githubusercontent.com/24354524/225560576-ba79110b-286a-4a5c-ba16-74774e858f02.png">

We do this by clicking the + button (as seen above) and pasting a link to a package on the upper-right hand side of the modal that shows up. (This can be usually found in READMEs in the repositories of the packages that you would like to import. For example, you can find the link specified in Moya's documentation [here](https://github.com/Moya/Moya#swift-package-manager).)

<img width="1088" alt="Screenshot 2023-03-16 at 4 38 13 PM" src="https://user-images.githubusercontent.com/24354524/225560939-4e166195-a0b1-43be-9c5c-10c909253684.png">

