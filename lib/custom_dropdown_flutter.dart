import 'package:flutter/material.dart';

List<String> items = ['Orange', 'Apple', "Grapes"];

class CustomDropDown extends StatefulWidget {
  const CustomDropDown({
    super.key,
    this.icons = Icons.arrow_drop_down,
    this.hintText,
    this.borderRadiusTop,
    this.borderRadiusBelow,
    this.itemsList,
    this.buttonBackColor,
    this.menuBackColor,
    this.style,
    this.iconColor = Colors.black,
  });
  final IconData? icons;
  final String? hintText;
  final double? borderRadiusTop, borderRadiusBelow;
  final List<String>? itemsList;
  final Color? buttonBackColor, menuBackColor, iconColor;
  final TextStyle? style;
  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  final OverlayPortalController _tooltipController = OverlayPortalController();
  final _link = LayerLink();
  double? _buttonWidth;
  final ScrollController _scrollController = ScrollController();
  String? _selectedItem; // ✅ Track selected item
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.itemsList ?? [];

    return CompositedTransformTarget(
      link: _link,
      child: OverlayPortal(
        controller: _tooltipController,
        overlayChildBuilder: (BuildContext context) {
          return CompositedTransformFollower(
            link: _link,
            targetAnchor: Alignment.bottomLeft,
            child: Align(
              alignment: AlignmentDirectional.topStart,
              child: MenuWidget(
                menuBackColor: widget.menuBackColor,
                width: _buttonWidth,
                borderRadiusBelow: widget.borderRadiusBelow,
                borderRadiusTop: widget.borderRadiusTop,
                child: Scrollbar(
                  thumbVisibility: false,

                  controller: _scrollController,
                  radius: const Radius.circular(8),
                  thickness: 4,
                  child: ListView.separated(
                    controller: _scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    itemBuilder: (context, index) {
                      final item = items[index];
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedItem = item;
                          });
                          _tooltipController.hide();
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(item, style: widget.style),
                        ),
                      );
                    },
                    separatorBuilder:
                        (context, index) => const SizedBox(height: 10),
                    itemCount: items.length,
                  ),
                ),
              ),
            ),
          );
        },
        child: ButtonWidget(
          menuBackColor: widget.buttonBackColor,
          borderRadiusTop: widget.borderRadiusTop,
          onTap: () => onTap(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Text(
                  _selectedItem ?? widget.hintText ?? 'Select Item',
                  style: widget.style ?? TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Icon(widget.icons, color: widget.iconColor),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onTap() {
    setState(() {
      _buttonWidth = context.size?.width;
    });
    _tooltipController.toggle();
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.height = 48,
    this.width,
    this.onTap,
    this.child,
    this.borderRadiusTop,
    this.menuBackColor,
  });

  final double? height, borderRadiusTop;
  final double? width;

  final VoidCallback? onTap;

  final Widget? child;
  final Color? menuBackColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Material(
        color: menuBackColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadiusTop ?? 12),
          side: const BorderSide(color: Colors.black12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(10),
          child: child,
        ),
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({
    super.key,
    this.width,
    this.child,
    this.onTap,
    this.height,
    this.borderRadiusTop,
    this.borderRadiusBelow,
    this.menuBackColor,
  });
  final void Function()? onTap;
  final double? width;
  final double? height, borderRadiusTop, borderRadiusBelow;
  final Widget? child;
  final Color? menuBackColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.only(top: 1),
      width: width ?? 200,
      height: height ?? 200,
      decoration: ShapeDecoration(
        color: menuBackColor ?? Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1,
            color: Colors.black45.withValues(alpha: 0.1),
          ),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(borderRadiusTop ?? 12),
            topRight: Radius.circular(borderRadiusTop ?? 12),
            bottomRight: Radius.circular(borderRadiusBelow ?? 15),
            bottomLeft: Radius.circular(borderRadiusBelow ?? 15),
          ),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x11000000),
            blurRadius: 32,
            offset: Offset(0, 20),
            spreadRadius: -8,
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: child,
      ),
    );
  }
}
