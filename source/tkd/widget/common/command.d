/**
 * Command module.
 *
 * License:
 *     MIT. See LICENSE for full details.
 */
module tkd.widget.common.command;

/**
 * These are common commands that apply to all widgets that have them injected.
 */
mixin template Command()
{
	import tkd.element.element : CommandCallback;

	/**
	 * Add a command to a widget.
	 *
	 * Params:
	 *     callback = The delegate callback to execute when invoking the command.
	 *
	 * Returns:
	 *     This widget to aid method chaining.
	 *
	 * Callback_Arguments:
	 *     These are the fields within the callback's $(LINK2 
	 *     ./element/element.html#CommandArgs, CommandArgs) parameter which 
	 *     are populated by this method when the callback is executed. 
	 *     $(P
	 *         $(PARAM_TABLE
	 *             $(PARAM_ROW CommandArgs.element, The element that executed the callback.)
	 *             $(PARAM_ROW CommandArgs.callback, The callback which was executed.)
	 *         )
	 *     )
	 *
	 * See_Also:
	 *     $(LINK2 ../../element/element.html#CommandCallback, tkd.element.element.CommandCallback)
	 */
	public auto setCommand(this T)(CommandCallback callback)
	{
		string command = this.createCommand(callback);
		this._tk.eval("%s configure -command %s", this.id, command);

		return cast(T) this;
	}

	/**
	 * Remove a previously set command.
	 *
	 * Returns:
	 *     This widget to aid method chaining.
	 */
	public auto removeCommand(this T)()
	{
		this._tk.deleteCommand(this.getCommandName());
		this._tk.eval("%s configure -command {}", this.id);

		return cast(T) this;
	}
}
