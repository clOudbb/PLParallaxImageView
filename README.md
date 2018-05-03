# PLParallaxImageView

![CocoaPods](https://img.shields.io/cocoapods/p/EZAnimationObjc.svg)

A parallax image view. Use like UIImageView

一个视差效果的ImageView，使用和ImageView一致

## Usage

In `tableView` or `collectionView` scroll delegate.

```javascript
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_tableView.visibleCells && _tableView.visibleCells > 0) {
        for (ImageTableViewCell *cell in _tableView.visibleCells) {
            [cell.imgView viewDidScroll];
        }
    }
}
```

