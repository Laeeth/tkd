/**
 * Menu module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.menu.menu;

/**
 * Imports.
 */
import tkd.element.uielement;
import tkd.widget.menu.menubar;

/**
 * The cascading menu that items are selected from.
 *
 * Additional_Events:
 *     Additional events that can also be bound to using the $(LINK2 ../../element/uielement.html#UiElement.bind, bind) method.
 *     $(P
 *         &lt;&lt;MenuSelect&gt;&gt;,
 *         &lt;&lt;PrevWindow&gt;&gt;,
 *         &lt;Alt-Key&gt;,
 *         &lt;Button&gt;,
 *         &lt;ButtonRelease&gt;,
 *         &lt;Enter&gt;
 *         &lt;Key-Down&gt;,
 *         &lt;Key-Escape&gt;,
 *         &lt;Key-F10&gt;,
 *         &lt;Key-Left&gt;,
 *         &lt;Key-Return&gt;,
 *         &lt;Key-Right&gt;,
 *         &lt;Key-Tab&gt;,
 *         &lt;Key-Up&gt;,
 *         &lt;Key-space&gt;,
 *         &lt;Key&gt;,
 *         &lt;Leave&gt;,
 *         &lt;Motion&gt;,
 *     )
 *
 * See_Also:
 *     $(LINK2 ../../element/uielement.html, tkd.element.uielement)
 */
class Menu : UiElement
{
	/**
	 * Construct the widget.
	 *
	 * Params:
	 *     parent = The parent of this widget.
	 *     label = The label of the menu.
	 *
	 * See_Also:
	 *     $(LINK2 ../../element/uielement.html, tkd.element.uielement)
	 */
	public this(T)(T parent, string label) if (is(T == MenuBar))
	{
		super(parent);

		this._elementId = "menu";
		this._tk.eval("%s add cascade -menu [menu %s -type normal -tearoff 0] -label \"%s\"", parent.id, this.id, label);
	}

	/**
	 * Add an item to the menu.
	 *
	 * Params:
	 *     label = The label of the item.
	 *
	 * Returns:
	 *     This widget to aid method chaining.
	 */
	public auto addItem(this T)(string label)
	{
		this._tk.eval("%s add command -label \"%s\"", this.id, label);

		return cast(T) this;
	}

	/**
	 * Add a separator to the menu.
	 *
	 * Returns:
	 *     This widget to aid method chaining.
	 */
	public auto addSeparator(this T)()
	{
		this._tk.eval("%s add separator", this.id);

		return cast(T) this;
	}
}